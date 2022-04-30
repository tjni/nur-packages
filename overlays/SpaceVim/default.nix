final: prev: {
  vimPlugins =
    prev.vimPlugins
    // {
      SpaceVim = prev.vimPlugins.SpaceVim.overrideAttrs (oldAttrs: {
        patches = [
          ./patches/load_as_plugin.patch
          ./patches/disable_helptags.patch
          ./patches/disable_rtp_patching.patch
#          ./patches/disable_plugin_manager.patch
        ];
      });
    };
}
