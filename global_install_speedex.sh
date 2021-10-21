other_replicas=({2..4})

./install_speedex.sh

for i in "${other_replicas[@]}"; do
	ip="10.0.0.$i"
	echo "installing speedex on replica ${ip}"
	ssh ${ip} /bin/bash << EOF
		./cloudlab_init_scripts/install_speedex.sh
EOF

