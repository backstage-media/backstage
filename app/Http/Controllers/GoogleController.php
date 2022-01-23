<?php

namespace App\Http\Controllers;

use App\Providers\GoogleProvider;
use Illuminate\Http\Request;

class GoogleController extends Controller
{
    public function __construct(GoogleProvider $google)
    {
        $this->client = $google->client();
        $this->ytanalytics = $google->ytanalytics($this->client);
        $this->youtube = $google->youtube($this->client);
    }

    public function get_basic_stats(Request $request)
    {
        if ($request->session()->get('access_token')) {
            $client = $this->client;
            $client->setAccessToken($request->session()->get('access_token'));
            $client->refreshToken($request->session()->get('refresh_token'));
            //getting user general stats on Youtube
            $pageToken = NULL;
            $queryParams = [
                'endDate' => '2018-05-01',
                'ids' => 'channel==MINE',
                'metrics' => 'views,comments,likes,dislikes,estimatedMinutesWatched,averageViewDuration',
                'startDate' => '2010-01-01'
            ];
            //At this point we have the basics stats for your Youtube Channel.
            $response = $this->ytanalytics->reports->query($queryParams);
            $request->session()->put('mainstats', $response);
            $request->session()->put('access_token', $client->getAccessToken());
            return $response;
        } else {
            return redirect('/home')->with('error', 'you have not been authenticated');
        }
    }

    public function get_most_watched(Request $request)
    {
        if ($request->session()->get('access_token')) {
            $client = $this->client;
            $client->setAccessToken($request->session()->get('access_token'));
            $client->refreshToken($request->session()->get('refresh_token'));
            $pageToken = NULL;
            // Top 10 – Most viewed videos for a content owner
            $queryParams = [
                'ids' => 'channel==MINE',
                'dimensions' => 'video',
                'metrics' => 'estimatedMinutesWatched,views,likes,subscribersGained',
                'maxResults' => 10,
                'sort' => '-estimatedMinutesWatched',
                'startDate' => '2010-01-01',
                'endDate' => '2018-05-01'
            ];
            //At this point we have the basics stats for your Youtube Channel.
            $response = $this->ytanalytics->reports->query($queryParams);
            $request->session()->put('access_token', $client->getAccessToken());
            return $response;
        } else {
            return redirect('/home')->with('error', 'you have not been authenticated');
        }
    }

    public function get_latest_videos(Request $request)
    {
        if ($request->session()->get('access_token')) {
            $client = $this->client;
            $client->setAccessToken($request->session()->get('access_token'));
            $client->refreshToken($request->session()->get('refresh_token'));
            $channelId = $request->session()->get('youtube_channel_id');
            // Top 10 – Latest videos uploaded.
            $queryParams = [
                #'channelId' => $channelId,
                'forMine' => true,
                'type' => 'video',
                'maxResults' => 20,
                'order' => 'date'
            ];
            //At this point we have the basics stats for your Youtube Channel.
            $response = $this->youtube->search->listSearch('snippet,id', $queryParams);
            $request->session()->put('access_token', $client->getAccessToken());
            return $response;
        } else {
            return redirect('/home')->with('error', 'you have not been authenticated');
        }
    }

    public function get_channels_info(Request $request)
    {
        if ($request->session()->get('access_token')) {
            $client = $this->client;
            $client->setAccessToken($request->session()->get('access_token'));
            $client->refreshToken($request->session()->get('refresh_token'));
            $queryParams = [
                'mine' => true
            ];
            $response = $this->youtube->channels->listChannels('snippet,contentDetails,statistics', $queryParams);
            $request->session()->put('channels', $response);
            $request->session()->put('access_token', $client->getAccessToken());
            // Maybe think to move this to a different function just to generate all the user session from youtube.
            $request->session()->put('youtube_name', $response["items"][0]["snippet"]["title"]);
            $request->session()->put('youtube_avatar', $response["items"][0]["snippet"]["thumbnails"]["default"]["url"]);
            $request->session()->put('youtube_description', $response["items"][0]["snippet"]["description"]);
            return $response;
        } else {
            return redirect('/home')->with('error', 'you have not been authenticated');
        }
    }

    public function get_video_metadata(Request $request, $video_id)
    {
        if ($request->session()->get('access_token')) {
            $client = $this->client;
            $client->setAccessToken($request->session()->get('access_token'));
            $client->refreshToken($request->session()->get('refresh_token'));
            // Get metadata from specific video.
            $queryParams = [
                'id' => $video_id,
            ];
            //At this point we have the basics stats for your Youtube Channel.
            $response = $this->youtube->videos->listVideos('snippet,contentDetails,statistics,status', $queryParams);
            $request->session()->put('access_token', $client->getAccessToken());
            return $response;
        } else {
            return redirect('/home')->with('error', 'you have not been authenticated');
        }
    }

    public function get_video_advanced_metadata(Request $request, $video_id)
    {
        if ($request->session()->get('access_token')) {
            $client = $this->client;
            $client->setAccessToken($request->session()->get('access_token'));
            $client->refreshToken($request->session()->get('refresh_token'));
            $today = strval(date('Y-m-d'));
            // Get Advanced metadata using YTAnalytics from specific video.
            $queryParams = [
                'endDate' => $today,
                'filters' => 'video==' . $video_id,
                'ids' => 'channel==MINE',
                'metrics' => 'views,comments,likes,dislikes,estimatedMinutesWatched,averageViewDuration,subscribersGained,subscribersLost,averageViewPercentage',
                'startDate' => '2014-05-01'
            ];
            //At this point we have the basics stats for your Youtube Channel.
            $response = $this->ytanalytics->reports->query($queryParams);
            $request->session()->put('access_token', $client->getAccessToken());
            return $response;
        } else {
            return redirect('/home')->with('error', 'you have not been authenticated');
        }
    }

    public function get_channel_activity(Request $request)
    {
        $response ="";
        if ($request->session()->get('access_token')) {
            $client = $this->client;
            $client->setAccessToken($request->session()->get('access_token'));
            $client->refreshToken($request->session()->get('refresh_token'));
            // Get latest activity for the channel.
            $queryParams = [
                'maxResults' => 10,
                'mine' => true
            ];
            $response =  $this->youtube->activities->listActivities('id,snippet,contentDetails ', $queryParams);
        }
        return $response;
    }
}
