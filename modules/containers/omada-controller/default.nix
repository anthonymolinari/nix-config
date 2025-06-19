{ ... }: {

    virtualisation.oci-containers.containers.omadacontroller = {
        image = "mbentley/omada-controller:5.15";
        autoStart = true;
        environment = {
            TZ = "America/Los_Angeles";
        };
        volumes = [
            "/home/anthony/docker-volumes/omada/logs:/opt/tplink/EAPController/logs"
            "/home/anthony/docker-volumes/omada/data:/opt/tplink/EAPController/data"
        ];
        ports = [
            "8088:8088"
            "8043:8043"
            "27001:27001/udp"
            "29810:29810/udp"
            "29811-29816:29811-29816"
        ];
    };
}
