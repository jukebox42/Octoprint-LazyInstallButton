$(() => {
  function LazyInstallButtonViewModel(parameters) {
    const self = this;
    self.globalSettings = parameters[0]; // settingsViewModel

    self.settings = {};

    self.isEnabled = ko.observable(false);

    self.openDebugSettings = () => {
      self.globalSettings.show();
      self.globalSettings.selectTab("#settings_plugin_pluginmanager");
      // Find the plugin manager view and open the repo button.
      self.globalSettings.allViewModels.find(
          v => v.constructor.name === "PluginManagerViewModel"
        ).showRepository(true);
    };

    self.onBeforeBinding = function () {
      self.settings = self.globalSettings.settings.plugins.lazyinstallbutton;
      self.isEnabled(self.settings.enabled());
    };

    self.onSettingsBeforeSave = function () {
      self.isEnabled(self.settings.enabled());
    };
  }

  OCTOPRINT_VIEWMODELS.push({
    construct: LazyInstallButtonViewModel,
    dependencies: ["settingsViewModel"],
    elements: ["#navbar_plugin_lazyinstallbutton"]
  });
});