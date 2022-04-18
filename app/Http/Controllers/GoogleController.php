<?php

namespace App\Http\Controllers;

use App\Providers\GoogleProvider;
use Illuminate\Http\Request;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\UserController;
use App\Models\Notification;

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
        if ($request->session()->get('youtubeHandler')) {
            $client = $this->client;
            $youtubeHandler = $request->session()->get('youtubeHandler');
            $client->setAccessToken($youtubeHandler->getGoogleAccessToken());
            $client->refreshToken($youtubeHandler->getGoogleRefreshToken());
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
        if ($request->session()->get('youtubeHandler')) {
            $client = $this->client;
            $youtubeHandler = $request->session()->get('youtubeHandler');
            $client->setAccessToken($youtubeHandler->getGoogleAccessToken());
            $client->refreshToken($youtubeHandler->getGoogleRefreshToken());
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
        if ($request->session()->get('youtubeHandler')) {
            $client = $this->client;
            $youtubeHandler = $request->session()->get('youtubeHandler');
            $client->setAccessToken($youtubeHandler->getGoogleAccessToken());
            $client->refreshToken($youtubeHandler->getGoogleRefreshToken());
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
        if ($request->session()->get('youtubeHandler')) {
            $client = $this->client;
            $youtubeHandler = $request->session()->get('youtubeHandler');
            $client->setAccessToken($youtubeHandler->getGoogleAccessToken());
            $client->refreshToken($youtubeHandler->getGoogleRefreshToken());
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
        if ($request->session()->get('youtubeHandler')) {
            $client = $this->client;
            $youtubeHandler = $request->session()->get('youtubeHandler');
            $client->setAccessToken($youtubeHandler->getGoogleAccessToken());
            $client->refreshToken($youtubeHandler->getGoogleRefreshToken());
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
        if ($request->session()->get('youtubeHandler')) {
            $client = $this->client;
            $youtubeHandler = $request->session()->get('youtubeHandler');
            $client->setAccessToken($youtubeHandler->getGoogleAccessToken());
            $client->refreshToken($youtubeHandler->getGoogleRefreshToken());
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
        $response = "";
        if ($request->session()->get('youtubeHandler')) {
            $client = $this->client;
            $youtubeHandler = $request->session()->get('youtubeHandler');
            $client->setAccessToken($youtubeHandler->getGoogleAccessToken());
            $client->refreshToken($youtubeHandler->getGoogleRefreshToken());
            // Get latest activity for the channel.
            $queryParams = [
                'maxResults' => 10,
                'mine' => true
            ];
            $response =  $this->youtube->activities->listActivities('id,snippet,contentDetails ', $queryParams);
        }
        return $response;
    }

    public function change_video_visibility(Request $request)
    {
        if ($request->session()->get('youtubeHandler')) {
            $id = $request->post('video_id');
            $visibility = $request->post('visibility');
            $client = $this->client;
            $youtubeHandler = $request->session()->get('youtubeHandler');
            $client->setAccessToken($youtubeHandler->getGoogleAccessToken());
            $client->refreshToken($youtubeHandler->getGoogleRefreshToken());

            // Get metadata from specific video.
            $queryParams = [
                'id' => $id,
            ];
            // Update privacy status on a certain video
            $videoResponse = $this->youtube->videos->listVideos('snippet, status', $queryParams);
            $video = $videoResponse[0];
            $videoStatus = $video['status'];
            $videoDetails = $video['snippet'];
            $videoStatus->privacyStatus = $visibility;
            $video->setStatus($videoStatus);

            $this->youtube->videos->update('snippet, status', $video);

            // Generate notification at this action.
            $notificationController = new NotificationController;
            $contractController = new ContractController;
            $notification = new Notification;
            $userController = new UserController;
            $user_id = $request->user()->id;
            $user_type = $request->session()->get('profile_type');
            $profile = $request->session()->get('profile');
            $user = $userController->get_user_from_id($user_id);
        
            //In case notification is generated by a content creator.
            
            if ($user_type == 1) {
                $manager = $contractController->get_contract_manager($profile->id);
                $manager_user = $userController->get_user_from_manager($manager);
                if ($manager_user != null) {
                    $notification->from_user = $user->id;
                    $notification->to_user = $manager_user->id;
                    $notification->notification_type = 2;
                    $notification->message = 'Your video "' . $videoDetails->title . '" changed visibility to ' . $visibility;
                    $notification->target_id = $id;
                    $notification->save();
                }else if($user_type == 2)
                {

                }
                //In case notification is generated by a content manager.
            }

        }
    }
}
