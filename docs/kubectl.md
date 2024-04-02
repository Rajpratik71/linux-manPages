KUBERNETES(1)                   Jan 2015                   KUBERNETES(1)

NAME
       kubectl - kubectl controls the Kubernetes cluster manager

SYNOPSIS
       kubectl [OPTIONS]

DESCRIPTION
       kubectl controls the Kubernetes cluster manager.

       Find  more  information  at ⟨https://github.com/kubernetes/kuber‐
       netes⟩.

OPTIONS
       --alsologtostderr=false
           log to standard error as well as files

       --api-version=""
           DEPRECATED: The API version to use when talking to the server

       --certificate-authority=""
           Path to a cert. file for the certificate authority.

       --client-certificate=""
           Path to a client certificate file for TLS.

       --client-key=""
           Path to a client key file for TLS.

       --cluster=""
           The name of the kubeconfig cluster to use

       --context=""
           The name of the kubeconfig context to use

       --insecure-skip-tls-verify=false
           If true, the server's certificate will  not  be  checked  for
       validity. This will make your HTTPS connections insecure.

       --kubeconfig=""
           Path to the kubeconfig file to use for CLI requests.

       --log-backtrace-at=:0
           when logging hits line file:N, emit a stack trace

       --log-dir=""
           If non-empty, write log files in this directory

       --log-flush-frequency=5s
           Maximum number of seconds between log flushes

       --logtostderr=true
           log to standard error instead of files

       --match-server-version=false
           Require server version to match client version

       --namespace=""
           If present, the namespace scope for this CLI request.

       --password=""
           Password for basic authentication to the API server.

       -s, --server=""
           The address and port of the Kubernetes API server

       --stderrthreshold=2
           logs at or above this threshold go to stderr

       --token=""
           Bearer token for authentication to the API server.

       --user=""
           The name of the kubeconfig user to use

       --username=""
           Username for basic authentication to the API server.

       --v=0
           log level for V logs

       --vmodule=
           comma-separated  list of pattern=N settings for file-filtered
       logging

SEE ALSO
       kubectl-get(1),      kubectl-describe(1),      kubectl-create(1),
       kubectl-replace(1),      kubectl-patch(1),     kubectl-delete(1),
       kubectl-edit(1),     kubectl-apply(1),      kubectl-namespace(1),
       kubectl-logs(1),   kubectl-rolling-update(1),   kubectl-scale(1),
       kubectl-cordon(1),     kubectl-drain(1),     kubectl-uncordon(1),
       kubectl-attach(1),    kubectl-exec(1),   kubectl-port-forward(1),
       kubectl-proxy(1),        kubectl-run(1),         kubectl-stop(1),
       kubectl-expose(1),    kubectl-autoscale(1),   kubectl-rollout(1),
       kubectl-label(1),     kubectl-annotate(1),     kubectl-config(1),
       kubectl-cluster-info(1),   kubectl-api-versions(1),  kubectl-ver‐
       sion(1), kubectl-explain(1), kubectl-convert(1),

HISTORY
       January 2015, Originally compiled by Eric Paris (eparis at redhat
       dot  com)  based on the kubernetes source material, but hopefully
       they have been automatically generated since!

Eric Paris               kubernetes User Manuals           KUBERNETES(1)
