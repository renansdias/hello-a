node {
	stage 'Checkout Repo'
	git changelog: false, url: 'https://github.com/renansdias/hello-a'
	
	stage 'Build Docker Image'
	def hash = sh(script: 'git rev-parse HEAD | cut -c1-6 | tr -d \'\n\'', returnStdout: true)
	env.HASH = "${hash}"
	
	sh('docker build -t renansdias/hello-a:${HASH} .')
	
	stage 'Push Docker Image'
	sh('docker push renansdias/hello-a:${HASH}')
	
	stage 'Deploy to Kubernetes'
	sh('sed -i \'s/__VERSION__/\'${HASH}\'/g\' deployment-a.json')
	
	sh('kubectl apply -f deployment-a.json --context="aws_k8s" --kubeconfig="/var/lib/jenkins/.kube/config"')
	sh('kubectl apply -f service-a.json --context="aws_k8s" --kubeconfig="/var/lib/jenkins/.kube/config"')
}