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
      <a href="#" class="sidebar-toggle" data-toggle="collapse" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="../d_plantilla/dist/img/personas/user.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs"><?php echo $nombre_persona; ?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="../d_plantilla/dist/img/personas/user.jpg" class="img-circle" alt="User Image">

                <p>
                  <?php echo $nombre_persona; ?> - <?php echo $nombre_perfil; ?>
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