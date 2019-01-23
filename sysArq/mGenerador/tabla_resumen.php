<?php 
  include '../global_settings/conexion.php';
  session_name('sysOrigen');
  session_start();
  $id_contrato = $_SESSION['id_contrato'];
  $sql = "SELECT
          p_anticipo,
          p_fondo_garantia,
          p_iva,
          FORMAT(t_anticipo, 2),
          FORMAT(t_fondo_garantia, 2),
          FORMAT(t_iva, 2),
          FORMAT(total_contrato, 2),
          FORMAT(ROUND( ( total_contrato + t_iva ), 2 ), 2)AS total,
          FORMAT(ROUND( ( ( total_contrato * p_fondo_garantia ) / 100 ), 2 ), 2) AS garantia,
          FORMAT(ROUND(total_contrato, 2) - (( total_contrato * p_fondo_garantia ) / 100 ),2) as res
          FROM
            importes 
          WHERE
            id_contrato = '$id_contrato'";
  $exSql = mysqli_query($conexion, $sql);
  $row = mysqli_fetch_row($exSql);
  $sub = $row[9];
 ?>
  <table  class="table table-striped">
    <thead class="thead-dark">
      <tr>
        <th scope="col" colspan="6" bgcolor="#2ecc71">Resumen</th>
      </tr>
    </thead>
    <tr>
      <td>ANTICIPO</td>
      <td></td>
      <td align="center" style="font-size: 18px" bgcolor="#e67e22"><?php echo $row[0] ?></td>
      <td>%</td>
      <td></td>
      <td>$ <?php echo $row[3] ?></td>
    </tr>
    <tr>
      <td colspan="2">ESTIMADO</td>
      <td></td>
      <td></td>
      <td bgcolor="#f1c40f">$</td>
      <td></td>
    </tr>
    <tr>
      <td colspan="4">AMORTIZADO</td>
      <td style="color: red">-$<?php echo $row[3] ?></td>
      <td> $ </td>
    </tr>
    <tr>
      <td colspan="2">RETENCIÓN</td>
      <td align="center" style="font-size: 18px" bgcolor="#e67e22"><?php echo $row[1] ?></td>
      <td>%</td>
      <td></td>
      <td  style="color: red">-$ <?php echo $row[8] ?>  </td>
    </tr>
    <tr>
      <td colspan="5">SUB-TOTAL</td>
      <td> $ <?php echo $sub ?>  </td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <th>Pago sobre retenido</th>
      <td> $ <input type="text" size="5" class=""> </td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td> $ <?php echo $row[6] ?> </td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <th>IVA</th>
      <td> $ <?php echo $row[5] ?> </td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <th>TOTAL</th>
      <td> $ <?php echo $row[7] ?> </td>
    </tr>
  </table>