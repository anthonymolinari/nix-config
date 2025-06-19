{ ... }: {

    virtualisation.oci-containers.containers.homeassistant = {
        image = "homeassistant/home-assistant:2025.6";
        autoStart = true;
        environment = {
            TZ = "America/Los_Angeles";
        };
        extraOptions = [
            "--network=host"
        ];
    };

}
