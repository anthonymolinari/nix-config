{ ... }: {

    virtualisation.oci-containers.containers.openbooks = {
        image = "evanbuss/openbooks:4.5.0";
        autoStart = true;
        volumes = [
            "/home/anthony/docker-volumes/openbooks:/books"
        ];
        ports = [
            "4567:80"
        ];
        cmd = [ "--name" "iker_neptunis" "--persist" "-s" "irc.irchighway.net:9999"];
    };
}
