<html>

	<head>
	<title>Factura <?=$id?></title>
		<style type="text/css">
            
		body {		
			font-family: Verdana;
		}
		
		div.invoice {
		border:1px solid #ccc;
		padding:5px;
		height:740pt;
		width:540pt;
		}

		div.company-address {
			border:1px solid #ccc;
			float:left;
			width:200pt;
		}
		
		div.invoice-details {
			border:1px solid #ccc;
			float:right;
			width:200pt;
		}
		
		div.customer-address {
			border:1px solid #ccc;
			float:right;
			margin-bottom:50px;
			margin-top:100px;
			width:300pt;
		}
		
		div.clear-fix {
			clear:both;
			float:none;
		}
		
		table {
			width:100%;
		}
		
		th {
			text-align: left;
		}
		
		td {
		}
		
		.text-left {
			text-align:left;
		}
		
		.text-center {
			text-align:center;
		}
		
		.text-right {
			text-align:right;
		}
		
		</style>
	</head>

	<body>
	<div class="invoice">
		<div class="company-address">
			BackStage S.L
			<br />
			Calle Carreteria
			<br />
			Malaga, 29008
			<br />
		</div>
	
		<div class="invoice-details">
			Factura <?=$id?>
			<br />
			Fecha Generacion: <?=$generated_on?>
		</div>
		
		<div class="customer-address">
            <h3>Contrato entre Creador y Administrador de contenido</h3 >
			<br />
			Creador Contenido: <?=$creator->real_name?><br/>
            Administrador Contenido: <?=$manager->real_name?>
		</div>
		
		<div class="clear-fix"></div>
			<table border='1' cellspacing='0'>
				<tr>
					<th width=250>Description</th>
					<th width=50>Meses</th>
                    <th width=60>Precio por mes</th>
					<th width=60>Descuento Aplicado</th>
					<th width=60>Total</th>
				</tr>
                <tr>
                    <td>Duracion del contrato: <?=$start_date?> - <?=$end_date?></td>
                    <td class='text-center'><?=$duration?> Meses</td>
                    <td class='text-center'><?=$price_per_month?> €</td>
                    <td class='text-center'><?=$discount?> %</td>
                    <td class='text-center'><?=$final_price?> €</td>
                </tr>

			<?php
			$total = 0;
			$vat = 21;
			
			echo("<td colspan='4' class='text-right'><b>TOTAL</b></td>");
			echo("<td class='text-right'><b>" . $final_total . " €</b></td>");
			echo("</tr>");
			?>
			</table>
		</div>
	</body>

</html>