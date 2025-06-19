{ ... }: {

    virtualisation = {
        podman = {
            enable = true;
            dockerCompat = true;
            defaultNetwork.settings.dns_enabled = true;
        };
        containers = {
            enable = true;
        };
        oci-containers = {
            backend = "podman";
        };
    };

}
