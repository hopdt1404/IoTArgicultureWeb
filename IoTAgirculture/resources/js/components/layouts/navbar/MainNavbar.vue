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
          <li><router-link to="/"><a><Icon type="ios-speedometer" /> Dashboard</a></router-link> </li>
          <li><router-link to="/tags"><a><Icon type="ios-speedometer" /> Tags</a></router-link></li>
          <li><router-link to="/users"><a><Icon type="ios-speedometer" /> User</a></router-link></li>
          <li><router-link to="/devices"><a><Icon type="ios-speedometer" /> Devices</a></router-link></li>
        </ul>
      </div>
    </div>
  </div>
</template>
