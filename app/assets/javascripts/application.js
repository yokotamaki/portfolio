// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

/*global $*/
$(document).on('turbolinks:load', function() {

  /**トップ ナビゲーション**/
  $(function(){
    $(".top-nav .nav-room").hover(function(){
      $(this).text("客室");
    },function(){
      $(this).text("room");
    });

    $(".top-nav .nav-notice").hover(function(){
      $(this).text("お知らせ");
    },function(){
      $(this).text("notice");
    });

    $(".top-nav .nav-reservation").hover(function(){
      $(this).text("予約");
    },function(){
      $(this).text("reservation");
    });

    $(".top-nav .nav-review").hover(function(){
      $(this).text("クチコミ");
    },function(){
      $(this).text("review");
    });

    $(".top-nav .nav-access").hover(function(){
      $(this).text("アクセス");
    },function(){
      $(this).text("access");
    });

    $(".top-nav .nav-contact").hover(function(){
      $(this).text("お問い合わせ");
    },function(){
      $(this).text("contact");
    });

    $(".top-nav .nav-login").hover(function(){
      $(this).text("ログイン");
    },function(){
      $(this).text("login");
    });

    $(".top-nav .nav-mypage").hover(function(){
      $(this).text("マイページ");
    },function(){
      $(this).text("mypage");
    });

    $(".top-nav .nav-logout").hover(function(){
      $(this).text("ログアウト");
    },function(){
      $(this).text("logout");
    });
  });

  // テキストエリアの高さ自動調整
  $("textarea").attr("rows", 1).on("input", function() {
    $(this).height(0).innerHeight(this.scrollHeight);
  });
});