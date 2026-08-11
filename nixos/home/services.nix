{ config, lib, pkgs, inputs, ... }:
{
    services.activitywatch = {
    enable = true;
    
    settings = {
        port = 5600;
    };
};
}
