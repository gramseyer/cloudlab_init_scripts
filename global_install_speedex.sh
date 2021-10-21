replicas=({0..3})

for i in "${rep[@]}"; do
	ip="10.0.0.$i"
	echo "installing speedex on replica ${ip}"
	ssh ${ip} /bin/bash << EOF
		./cloudlab_init_scripts/install_speedex.sh
EOF

