{
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  security.sudo.extraConfig = ''
    Defaults env_keep += "EDITOR"
  '';
}
