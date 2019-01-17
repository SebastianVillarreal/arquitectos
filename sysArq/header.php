   <?php include 'mContratos/pendientes.php'; ?>
    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>S</b>A</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">Origen</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->


    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>



      <div id= "sidemenu" class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown notifications-menu">
                <!-- Menu toggle button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-bell fa-2x"></i>
                  <label class="badge"> <?php echo $row[0] ?> </label>
                </a> 
                <ul class="dropdown-menu">
                  <li class="header"></li>

                  <li>

                    <!-- Inner Menu: contains the notifications -->
                    <ul class="menu arti_caducos">

                    </ul>
                  </li>
                  <!--<li class="footer"><a href="#">View all</a></li>-->
                </ul>
          </li>
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../d_plantilla/dist/img/personas/user.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs"><?php echo $usr_name; ?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="../d_plantilla/dist/img/personas/user.jpg" class="img-circle" alt="User Image">

                <p>
                  <?php echo $usr_name; ?> - <?php echo $nombre_perfil; ?>
                  <small>Miembro desde Sept. 2018</small>
                </p>
              </li>
              <!-- Menu Body -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-right">
                  <a href="../global_seguridad/cerrarsesion.php" class="btn btn-default btn-flat">Cerrar Sesi&oacute;n</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <!--<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>-->
          </li>
        </ul>
      </div>
    </nav>