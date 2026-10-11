{
   programs.chromium = {
     enable = true;
     commandLineArgs = [
       "--enable-features=WebContentsForceDark"
       "--ozone-platform=wayland"
       "--render-node-override=/dev/dri/renderD128"
       "--restart"
       "--flag-switches-begin"
       "--close-confirmation=last"
       "--disable-top-sites"
       "--extension-mime-request-handling=always-prompt-for-install" 
       "--hide-fullscreen-exit-ui"
       "--show-avatar-button=incognito-and-guest"
       "--enable-features=WebContentsForceDark"
       "--disable-features=ClearDataOnExit"
       "--flag-switches-end"
     ];
   };
}
