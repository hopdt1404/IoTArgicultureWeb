<template>
  <div>
    <div class="_1side_menu_content">
      <div class="_1side_menu_img_name">
        <!-- <img class="_1side_menu_img" src="/pic.png" alt="" title=""> -->
        <p class="_1side_menu_name">Admin</p>
      </div>

      <!--~~~ MENU LIST ~~~~~~-->
      <div class="_1side_menu_list">
        <ul class="_1side_menu_list_ul">
          <li><router-link to="/"><a><Icon type="ios-home" /> Home</a></router-link> </li>
          <li><router-link to="/users"><a><Icon type="md-contacts" /> Users</a></router-link></li>
          <li><router-link to="/farms"><a><Icon type="ios-speedometer" /> Farms</a></router-link></li>
          <li><router-link to="/devices"><a><Icon type="md-square-outline" /> Devices</a></router-link></li>
          <li><router-link to="/devices"><a><Icon type="ios-cloudy-night-outline" /> Weather Forecast</a></router-link></li>
          <li><router-link to="/devices"><a><Icon type="ios-leaf" /> Plant</a></router-link></li>
          <li><router-link to="/devices"><a><Icon type="md-leaf" /> My Plant</a></router-link></li>
        </ul>
      </div>
    </div>
  </div>
</template>
