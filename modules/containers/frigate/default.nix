{ ... }: {

    virtualisation.oci-containers.contianers.frigate = {
        image = "ghcr.io/blakeblackshear/frigate:stable";
        autoStart = true;
        environment = {
            FRIGATE_RTSP_PASSWORD = "makesecret";
        };
        volumes = [
            "/etc/localtime:/etc/localtime:ro"
            "/home/anthony/docker-volumes/frigate/config:/config"
            "/home/anthony/docker-volumes/frigate/data:/media/frigate"
        ];
        ports = [
            "8971:8971"
            "8554:8554"
            "5000:5000"
            "8555:8555/tcp"
            "8555:8555/udp"
        ];
    };

}
