import json

x = [
    {
        "Command": "/usr/local/bin/kube-proxy --config=/var/lib/kube-proxy/config.conf --hostname-override=gremio-desktop",
        "Created": 1570042883,
        "HostConfig": {
            "NetworkMode": "container:0e312e716fe7415c8e30a713363de6b7636a8903983ad41f1f099ff516c27029"
        },
        "Id": "2f474ed8e103c650d15f65ee51a7e918849f34addb75f5a930b3c0b8a6bd51a9",
        "Image": "sha256:c21b0c7400f988db4777858edd13b6d3930d62d7ccf026d2415485a52037f384",
        "ImageID": "sha256:c21b0c7400f988db4777858edd13b6d3930d62d7ccf026d2415485a52037f384",
        "Labels": {
            "annotation.io.kubernetes.container.hash": "3d3a9263",
            "annotation.io.kubernetes.container.restartCount": "26",
            "annotation.io.kubernetes.container.terminationMessagePath": "/dev/termination-log",
            "annotation.io.kubernetes.container.terminationMessagePolicy": "File",
            "annotation.io.kubernetes.pod.terminationGracePeriod": "30",
            "io.kubernetes.container.logpath": "/var/log/pods/kube-system_kube-proxy-qddkg_10f7fc16-c6fc-4a84-b1e1-90c0b99f71c1/kube-proxy/26.log",
            "io.kubernetes.container.name": "kube-proxy",
            "io.kubernetes.docker.type": "container",
            "io.kubernetes.pod.name": "kube-proxy-qddkg",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "10f7fc16-c6fc-4a84-b1e1-90c0b99f71c1",
            "io.kubernetes.sandbox.id": "0e312e716fe7415c8e30a713363de6b7636a8903983ad41f1f099ff516c27029"
        },
        "Mounts": [
            {
                "Destination": "/var/run/secrets/kubernetes.io/serviceaccount",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/var/lib/kubelet/pods/10f7fc16-c6fc-4a84-b1e1-90c0b99f71c1/volumes/kubernetes.io~secret/kube-proxy-token-z6blc",
                "Type": "bind"
            },
            {
                "Destination": "/dev/termination-log",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/10f7fc16-c6fc-4a84-b1e1-90c0b99f71c1/containers/kube-proxy/9691281d",
                "Type": "bind"
            },
            {
                "Destination": "/etc/hosts",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/10f7fc16-c6fc-4a84-b1e1-90c0b99f71c1/etc-hosts",
                "Type": "bind"
            },
            {
                "Destination": "/lib/modules",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/lib/modules",
                "Type": "bind"
            },
            {
                "Destination": "/run/xtables.lock",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/run/xtables.lock",
                "Type": "bind"
            },
            {
                "Destination": "/var/lib/kube-proxy",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/var/lib/kubelet/pods/10f7fc16-c6fc-4a84-b1e1-90c0b99f71c1/volumes/kubernetes.io~configmap/kube-proxy",
                "Type": "bind"
            }
        ],
        "Names": [
            "/k8s_kube-proxy_kube-proxy-qddkg_kube-system_10f7fc16-c6fc-4a84-b1e1-90c0b99f71c1_26"
        ],
        "NetworkSettings": {
            "Networks": {}
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    },
    {
        "Command": "/pause",
        "Created": 1570042882,
        "HostConfig": {
            "NetworkMode": "host"
        },
        "Id": "0e312e716fe7415c8e30a713363de6b7636a8903983ad41f1f099ff516c27029",
        "Image": "k8s.gcr.io/pause:3.1",
        "ImageID": "sha256:da86e6ba6ca197bf6bc5e9d900febd906b133eaa4750e6bed647b0fbe50ed43e",
        "Labels": {
            "annotation.kubernetes.io/config.seen": "2019-10-02T15:01:22.459244125-04:00",
            "annotation.kubernetes.io/config.source": "api",
            "controller-revision-hash": "68594d95c",
            "io.kubernetes.container.name": "POD",
            "io.kubernetes.docker.type": "podsandbox",
            "io.kubernetes.pod.name": "kube-proxy-qddkg",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "10f7fc16-c6fc-4a84-b1e1-90c0b99f71c1",
            "k8s-app": "kube-proxy",
            "pod-template-generation": "1"
        },
        "Mounts": [],
        "Names": [
            "/k8s_POD_kube-proxy-qddkg_kube-system_10f7fc16-c6fc-4a84-b1e1-90c0b99f71c1_26"
        ],
        "NetworkSettings": {
            "Networks": {
                "host": {
                    "Aliases": null,
                    "DriverOpts": null,
                    "EndpointID": "8352b8534003a552cd7a3f96f9eb2665d6aee519c6f299114cb8204702833072",
                    "Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "IPAMConfig": null,
                    "IPAddress": "",
                    "IPPrefixLen": 0,
                    "IPv6Gateway": "",
                    "Links": null,
                    "MacAddress": "",
                    "NetworkID": "c3af67692643e3ddfa8b15f7ff753157d7f86e8fb7e939b4274c28effb4c4ec7"
                }
            }
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    },
    {
        "Command": "etcd --advertise-client-urls=https://192.168.0.158:2379 --cert-file=/etc/kubernetes/pki/etcd/server.crt --client-cert-auth=true --data-dir=/var/lib/etcd --initial-advertise-peer-urls=https://192.168.0.158:2380 --initial-cluster=gremio-desktop=https://192.168.0.158:2380 --key-file=/etc/kubernetes/pki/etcd/server.key --listen-client-urls=https://127.0.0.1:2379,https://192.168.0.158:2379 --listen-metrics-urls=http://127.0.0.1:2381 --listen-peer-urls=https://192.168.0.158:2380 --name=gremio-desktop --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt --peer-client-cert-auth=true --peer-key-file=/etc/kubernetes/pki/etcd/peer.key --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt --snapshot-count=10000 --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt",
        "Created": 1570042873,
        "HostConfig": {
            "NetworkMode": "container:aa287c13ee1a279287ea2551eca009ca57166ae57b02bf995fac0c083847e636"
        },
        "Id": "df1fd3a1dc23ece5d7d0e0132a50d635a43b39edbcef645510d58c70811c7dd9",
        "Image": "sha256:b2756210eeabf84f3221da9959e9483f3919dc2aaab4cd45e7cd072fcbde27ed",
        "ImageID": "sha256:b2756210eeabf84f3221da9959e9483f3919dc2aaab4cd45e7cd072fcbde27ed",
        "Labels": {
            "annotation.io.kubernetes.container.hash": "df368d9a",
            "annotation.io.kubernetes.container.restartCount": "33",
            "annotation.io.kubernetes.container.terminationMessagePath": "/dev/termination-log",
            "annotation.io.kubernetes.container.terminationMessagePolicy": "File",
            "annotation.io.kubernetes.pod.terminationGracePeriod": "30",
            "io.kubernetes.container.logpath": "/var/log/pods/kube-system_etcd-gremio-desktop_fe9340922db237e034511378c135a2a3/etcd/33.log",
            "io.kubernetes.container.name": "etcd",
            "io.kubernetes.docker.type": "container",
            "io.kubernetes.pod.name": "etcd-gremio-desktop",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "fe9340922db237e034511378c135a2a3",
            "io.kubernetes.sandbox.id": "aa287c13ee1a279287ea2551eca009ca57166ae57b02bf995fac0c083847e636"
        },
        "Mounts": [
            {
                "Destination": "/dev/termination-log",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/fe9340922db237e034511378c135a2a3/containers/etcd/e568e54a",
                "Type": "bind"
            },
            {
                "Destination": "/etc/hosts",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/fe9340922db237e034511378c135a2a3/etc-hosts",
                "Type": "bind"
            },
            {
                "Destination": "/etc/kubernetes/pki/etcd",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/etc/kubernetes/pki/etcd",
                "Type": "bind"
            },
            {
                "Destination": "/var/lib/etcd",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/etcd",
                "Type": "bind"
            }
        ],
        "Names": [
            "/k8s_etcd_etcd-gremio-desktop_kube-system_fe9340922db237e034511378c135a2a3_33"
        ],
        "NetworkSettings": {
            "Networks": {}
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    },
    {
        "Command": "kube-apiserver --advertise-address=192.168.0.158 --allow-privileged=true --authorization-mode=Node,RBAC --client-ca-file=/etc/kubernetes/pki/ca.crt --enable-admission-plugins=NodeRestriction --enable-bootstrap-token-auth=true --etcd-cafile=/etc/kubernetes/pki/etcd/ca.crt --etcd-certfile=/etc/kubernetes/pki/apiserver-etcd-client.crt --etcd-keyfile=/etc/kubernetes/pki/apiserver-etcd-client.key --etcd-servers=https://127.0.0.1:2379 --insecure-port=0 --kubelet-client-certificate=/etc/kubernetes/pki/apiserver-kubelet-client.crt --kubelet-client-key=/etc/kubernetes/pki/apiserver-kubelet-client.key --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname --proxy-client-cert-file=/etc/kubernetes/pki/front-proxy-client.crt --proxy-client-key-file=/etc/kubernetes/pki/front-proxy-client.key --requestheader-allowed-names=front-proxy-client --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --requestheader-extra-headers-prefix=X-Remote-Extra- --requestheader-group-headers=X-Remote-Group --requestheader-username-headers=X-Remote-User --secure-port=6443 --service-account-key-file=/etc/kubernetes/pki/sa.pub --service-cluster-ip-range=10.96.0.0/12 --tls-cert-file=/etc/kubernetes/pki/apiserver.crt --tls-private-key-file=/etc/kubernetes/pki/apiserver.key",
        "Created": 1570042873,
        "HostConfig": {
            "NetworkMode": "container:4da42abe76c996f728b54f2d7c0ecbe835d68f7f33dc0a7fe6085adc962d8645"
        },
        "Id": "5d7fdeced7b795799b7934b4ddee96c61cb24d0c621ff5ac1594cd65d600d516",
        "Image": "sha256:b305571ca60a5a7818bda47da122683d75e8a1907475681ee8b1efbd06bff12e",
        "ImageID": "sha256:b305571ca60a5a7818bda47da122683d75e8a1907475681ee8b1efbd06bff12e",
        "Labels": {
            "annotation.io.kubernetes.container.hash": "d26450ab",
            "annotation.io.kubernetes.container.restartCount": "34",
            "annotation.io.kubernetes.container.terminationMessagePath": "/dev/termination-log",
            "annotation.io.kubernetes.container.terminationMessagePolicy": "File",
            "annotation.io.kubernetes.pod.terminationGracePeriod": "30",
            "io.kubernetes.container.logpath": "/var/log/pods/kube-system_kube-apiserver-gremio-desktop_451e47a8afcc3decc38ce1137435be05/kube-apiserver/34.log",
            "io.kubernetes.container.name": "kube-apiserver",
            "io.kubernetes.docker.type": "container",
            "io.kubernetes.pod.name": "kube-apiserver-gremio-desktop",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "451e47a8afcc3decc38ce1137435be05",
            "io.kubernetes.sandbox.id": "4da42abe76c996f728b54f2d7c0ecbe835d68f7f33dc0a7fe6085adc962d8645"
        },
        "Mounts": [
            {
                "Destination": "/usr/local/share/ca-certificates",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/usr/local/share/ca-certificates",
                "Type": "bind"
            },
            {
                "Destination": "/usr/share/ca-certificates",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/usr/share/ca-certificates",
                "Type": "bind"
            },
            {
                "Destination": "/dev/termination-log",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/451e47a8afcc3decc38ce1137435be05/containers/kube-apiserver/0f20ff54",
                "Type": "bind"
            },
            {
                "Destination": "/etc/ca-certificates",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/ca-certificates",
                "Type": "bind"
            },
            {
                "Destination": "/etc/hosts",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/451e47a8afcc3decc38ce1137435be05/etc-hosts",
                "Type": "bind"
            },
            {
                "Destination": "/etc/kubernetes/pki",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/kubernetes/pki",
                "Type": "bind"
            },
            {
                "Destination": "/etc/pki",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/pki",
                "Type": "bind"
            },
            {
                "Destination": "/etc/ssl/certs",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/ssl/certs",
                "Type": "bind"
            }
        ],
        "Names": [
            "/k8s_kube-apiserver_kube-apiserver-gremio-desktop_kube-system_451e47a8afcc3decc38ce1137435be05_34"
        ],
        "NetworkSettings": {
            "Networks": {}
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    },
    {
        "Command": "kube-scheduler --authentication-kubeconfig=/etc/kubernetes/scheduler.conf --authorization-kubeconfig=/etc/kubernetes/scheduler.conf --bind-address=127.0.0.1 --kubeconfig=/etc/kubernetes/scheduler.conf --leader-elect=true",
        "Created": 1570042873,
        "HostConfig": {
            "NetworkMode": "container:57d36aa70e8ef899336b09c06304e2751f5b3d99c5c87aa0ce90a05560de3e48"
        },
        "Id": "c4c97325b39b3db62a027a1e0252e4909073f38fb7c57f5ddb82301bd4af6c49",
        "Image": "sha256:301ddc62b80b16315d3c2653cf3888370394277afb3187614cfa20edc352ca0a",
        "ImageID": "sha256:301ddc62b80b16315d3c2653cf3888370394277afb3187614cfa20edc352ca0a",
        "Labels": {
            "annotation.io.kubernetes.container.hash": "6da723ca",
            "annotation.io.kubernetes.container.restartCount": "107",
            "annotation.io.kubernetes.container.terminationMessagePath": "/dev/termination-log",
            "annotation.io.kubernetes.container.terminationMessagePolicy": "File",
            "annotation.io.kubernetes.pod.terminationGracePeriod": "30",
            "io.kubernetes.container.logpath": "/var/log/pods/kube-system_kube-scheduler-gremio-desktop_c18ee741ac4ad7b2bfda7d88116f3047/kube-scheduler/107.log",
            "io.kubernetes.container.name": "kube-scheduler",
            "io.kubernetes.docker.type": "container",
            "io.kubernetes.pod.name": "kube-scheduler-gremio-desktop",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "c18ee741ac4ad7b2bfda7d88116f3047",
            "io.kubernetes.sandbox.id": "57d36aa70e8ef899336b09c06304e2751f5b3d99c5c87aa0ce90a05560de3e48"
        },
        "Mounts": [
            {
                "Destination": "/dev/termination-log",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/c18ee741ac4ad7b2bfda7d88116f3047/containers/kube-scheduler/387c3e00",
                "Type": "bind"
            },
            {
                "Destination": "/etc/hosts",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/c18ee741ac4ad7b2bfda7d88116f3047/etc-hosts",
                "Type": "bind"
            },
            {
                "Destination": "/etc/kubernetes/scheduler.conf",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/kubernetes/scheduler.conf",
                "Type": "bind"
            }
        ],
        "Names": [
            "/k8s_kube-scheduler_kube-scheduler-gremio-desktop_kube-system_c18ee741ac4ad7b2bfda7d88116f3047_107"
        ],
        "NetworkSettings": {
            "Networks": {}
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    },
    {
        "Command": "kube-controller-manager --authentication-kubeconfig=/etc/kubernetes/controller-manager.conf --authorization-kubeconfig=/etc/kubernetes/controller-manager.conf --bind-address=127.0.0.1 --client-ca-file=/etc/kubernetes/pki/ca.crt --cluster-signing-cert-file=/etc/kubernetes/pki/ca.crt --cluster-signing-key-file=/etc/kubernetes/pki/ca.key --controllers=*,bootstrapsigner,tokencleaner --kubeconfig=/etc/kubernetes/controller-manager.conf --leader-elect=true --requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt --root-ca-file=/etc/kubernetes/pki/ca.crt --service-account-private-key-file=/etc/kubernetes/pki/sa.key --use-service-account-credentials=true",
        "Created": 1570042873,
        "HostConfig": {
            "NetworkMode": "container:391d8aecd2c8ee323726a74e6248fea8a24c21799345667d61b18fb71f2ef736"
        },
        "Id": "24c3072edac0d4747b0bdae8ce884d94a99f88fc45b6bd90100596abbdff5333",
        "Image": "sha256:06a629a7e51cdcc81a5ed6a3e6650348312f20c954ac52ee489a023628ec9c7d",
        "ImageID": "sha256:06a629a7e51cdcc81a5ed6a3e6650348312f20c954ac52ee489a023628ec9c7d",
        "Labels": {
            "annotation.io.kubernetes.container.hash": "edc2df85",
            "annotation.io.kubernetes.container.restartCount": "111",
            "annotation.io.kubernetes.container.terminationMessagePath": "/dev/termination-log",
            "annotation.io.kubernetes.container.terminationMessagePolicy": "File",
            "annotation.io.kubernetes.pod.terminationGracePeriod": "30",
            "io.kubernetes.container.logpath": "/var/log/pods/kube-system_kube-controller-manager-gremio-desktop_5c21306a65dd081e1f8bbec6db1a1610/kube-controller-manager/111.log",
            "io.kubernetes.container.name": "kube-controller-manager",
            "io.kubernetes.docker.type": "container",
            "io.kubernetes.pod.name": "kube-controller-manager-gremio-desktop",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "5c21306a65dd081e1f8bbec6db1a1610",
            "io.kubernetes.sandbox.id": "391d8aecd2c8ee323726a74e6248fea8a24c21799345667d61b18fb71f2ef736"
        },
        "Mounts": [
            {
                "Destination": "/usr/local/share/ca-certificates",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/usr/local/share/ca-certificates",
                "Type": "bind"
            },
            {
                "Destination": "/dev/termination-log",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/5c21306a65dd081e1f8bbec6db1a1610/containers/kube-controller-manager/a2eaea3a",
                "Type": "bind"
            },
            {
                "Destination": "/etc/kubernetes/pki",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/kubernetes/pki",
                "Type": "bind"
            },
            {
                "Destination": "/etc/kubernetes/controller-manager.conf",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/kubernetes/controller-manager.conf",
                "Type": "bind"
            },
            {
                "Destination": "/etc/pki",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/pki",
                "Type": "bind"
            },
            {
                "Destination": "/etc/ssl/certs",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/ssl/certs",
                "Type": "bind"
            },
            {
                "Destination": "/usr/libexec/kubernetes/kubelet-plugins/volume/exec",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/usr/libexec/kubernetes/kubelet-plugins/volume/exec",
                "Type": "bind"
            },
            {
                "Destination": "/usr/share/ca-certificates",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/usr/share/ca-certificates",
                "Type": "bind"
            },
            {
                "Destination": "/etc/ca-certificates",
                "Mode": "ro",
                "Propagation": "rprivate",
                "RW": false,
                "Source": "/etc/ca-certificates",
                "Type": "bind"
            },
            {
                "Destination": "/etc/hosts",
                "Mode": "",
                "Propagation": "rprivate",
                "RW": true,
                "Source": "/var/lib/kubelet/pods/5c21306a65dd081e1f8bbec6db1a1610/etc-hosts",
                "Type": "bind"
            }
        ],
        "Names": [
            "/k8s_kube-controller-manager_kube-controller-manager-gremio-desktop_kube-system_5c21306a65dd081e1f8bbec6db1a1610_111"
        ],
        "NetworkSettings": {
            "Networks": {}
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    },
    {
        "Command": "/pause",
        "Created": 1570042872,
        "HostConfig": {
            "NetworkMode": "host"
        },
        "Id": "aa287c13ee1a279287ea2551eca009ca57166ae57b02bf995fac0c083847e636",
        "Image": "k8s.gcr.io/pause:3.1",
        "ImageID": "sha256:da86e6ba6ca197bf6bc5e9d900febd906b133eaa4750e6bed647b0fbe50ed43e",
        "Labels": {
            "annotation.kubernetes.io/config.hash": "fe9340922db237e034511378c135a2a3",
            "annotation.kubernetes.io/config.seen": "2019-10-02T15:01:07.941073443-04:00",
            "annotation.kubernetes.io/config.source": "file",
            "component": "etcd",
            "io.kubernetes.container.name": "POD",
            "io.kubernetes.docker.type": "podsandbox",
            "io.kubernetes.pod.name": "etcd-gremio-desktop",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "fe9340922db237e034511378c135a2a3",
            "tier": "control-plane"
        },
        "Mounts": [],
        "Names": [
            "/k8s_POD_etcd-gremio-desktop_kube-system_fe9340922db237e034511378c135a2a3_27"
        ],
        "NetworkSettings": {
            "Networks": {
                "host": {
                    "Aliases": null,
                    "DriverOpts": null,
                    "EndpointID": "c03ea414ea136751b67c8983a89ec9a30264ecab2ee123b16b77daf99ce32f5e",
                    "Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "IPAMConfig": null,
                    "IPAddress": "",
                    "IPPrefixLen": 0,
                    "IPv6Gateway": "",
                    "Links": null,
                    "MacAddress": "",
                    "NetworkID": "c3af67692643e3ddfa8b15f7ff753157d7f86e8fb7e939b4274c28effb4c4ec7"
                }
            }
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    },
    {
        "Command": "/pause",
        "Created": 1570042872,
        "HostConfig": {
            "NetworkMode": "host"
        },
        "Id": "4da42abe76c996f728b54f2d7c0ecbe835d68f7f33dc0a7fe6085adc962d8645",
        "Image": "k8s.gcr.io/pause:3.1",
        "ImageID": "sha256:da86e6ba6ca197bf6bc5e9d900febd906b133eaa4750e6bed647b0fbe50ed43e",
        "Labels": {
            "annotation.kubernetes.io/config.hash": "451e47a8afcc3decc38ce1137435be05",
            "annotation.kubernetes.io/config.seen": "2019-10-02T15:01:07.941083516-04:00",
            "annotation.kubernetes.io/config.source": "file",
            "component": "kube-apiserver",
            "io.kubernetes.container.name": "POD",
            "io.kubernetes.docker.type": "podsandbox",
            "io.kubernetes.pod.name": "kube-apiserver-gremio-desktop",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "451e47a8afcc3decc38ce1137435be05",
            "tier": "control-plane"
        },
        "Mounts": [],
        "Names": [
            "/k8s_POD_kube-apiserver-gremio-desktop_kube-system_451e47a8afcc3decc38ce1137435be05_27"
        ],
        "NetworkSettings": {
            "Networks": {
                "host": {
                    "Aliases": null,
                    "DriverOpts": null,
                    "EndpointID": "5708b93f88331ca0c7609eb8e5d362eeef1ef4592eaa53d8580b41616a68fd34",
                    "Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "IPAMConfig": null,
                    "IPAddress": "",
                    "IPPrefixLen": 0,
                    "IPv6Gateway": "",
                    "Links": null,
                    "MacAddress": "",
                    "NetworkID": "c3af67692643e3ddfa8b15f7ff753157d7f86e8fb7e939b4274c28effb4c4ec7"
                }
            }
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    },
    {
        "Command": "/pause",
        "Created": 1570042872,
        "HostConfig": {
            "NetworkMode": "host"
        },
        "Id": "57d36aa70e8ef899336b09c06304e2751f5b3d99c5c87aa0ce90a05560de3e48",
        "Image": "k8s.gcr.io/pause:3.1",
        "ImageID": "sha256:da86e6ba6ca197bf6bc5e9d900febd906b133eaa4750e6bed647b0fbe50ed43e",
        "Labels": {
            "annotation.kubernetes.io/config.hash": "c18ee741ac4ad7b2bfda7d88116f3047",
            "annotation.kubernetes.io/config.seen": "2019-10-02T15:01:07.941089008-04:00",
            "annotation.kubernetes.io/config.source": "file",
            "component": "kube-scheduler",
            "io.kubernetes.container.name": "POD",
            "io.kubernetes.docker.type": "podsandbox",
            "io.kubernetes.pod.name": "kube-scheduler-gremio-desktop",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "c18ee741ac4ad7b2bfda7d88116f3047",
            "tier": "control-plane"
        },
        "Mounts": [],
        "Names": [
            "/k8s_POD_kube-scheduler-gremio-desktop_kube-system_c18ee741ac4ad7b2bfda7d88116f3047_27"
        ],
        "NetworkSettings": {
            "Networks": {
                "host": {
                    "Aliases": null,
                    "DriverOpts": null,
                    "EndpointID": "448856213db2872d3de117c8694d72f27a6453fa1170dda37ee0e85b2b2c9983",
                    "Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "IPAMConfig": null,
                    "IPAddress": "",
                    "IPPrefixLen": 0,
                    "IPv6Gateway": "",
                    "Links": null,
                    "MacAddress": "",
                    "NetworkID": "c3af67692643e3ddfa8b15f7ff753157d7f86e8fb7e939b4274c28effb4c4ec7"
                }
            }
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    },
    {
        "Command": "/pause",
        "Created": 1570042872,
        "HostConfig": {
            "NetworkMode": "host"
        },
        "Id": "391d8aecd2c8ee323726a74e6248fea8a24c21799345667d61b18fb71f2ef736",
        "Image": "k8s.gcr.io/pause:3.1",
        "ImageID": "sha256:da86e6ba6ca197bf6bc5e9d900febd906b133eaa4750e6bed647b0fbe50ed43e",
        "Labels": {
            "annotation.kubernetes.io/config.hash": "5c21306a65dd081e1f8bbec6db1a1610",
            "annotation.kubernetes.io/config.seen": "2019-10-02T15:01:07.941086457-04:00",
            "annotation.kubernetes.io/config.source": "file",
            "component": "kube-controller-manager",
            "io.kubernetes.container.name": "POD",
            "io.kubernetes.docker.type": "podsandbox",
            "io.kubernetes.pod.name": "kube-controller-manager-gremio-desktop",
            "io.kubernetes.pod.namespace": "kube-system",
            "io.kubernetes.pod.uid": "5c21306a65dd081e1f8bbec6db1a1610",
            "tier": "control-plane"
        },
        "Mounts": [],
        "Names": [
            "/k8s_POD_kube-controller-manager-gremio-desktop_kube-system_5c21306a65dd081e1f8bbec6db1a1610_28"
        ],
        "NetworkSettings": {
            "Networks": {
                "host": {
                    "Aliases": null,
                    "DriverOpts": null,
                    "EndpointID": "00e47a065fd9f231bc60b8033f696ffdcb105e3844573fa9fc43af53fb162527",
                    "Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "IPAMConfig": null,
                    "IPAddress": "",
                    "IPPrefixLen": 0,
                    "IPv6Gateway": "",
                    "Links": null,
                    "MacAddress": "",
                    "NetworkID": "c3af67692643e3ddfa8b15f7ff753157d7f86e8fb7e939b4274c28effb4c4ec7"
                }
            }
        },
        "Ports": [],
        "State": "running",
        "Status": "Up 45 minutes"
    }
]


y = json.loads(x)

print(y["command"])
