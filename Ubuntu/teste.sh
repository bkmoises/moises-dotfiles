#!/bin/bash

function loading() {
	local mensagem="$1"
	local delay=0.5
	local num_pontos=3

	echo -n "$mensagem"
	for ((i = 0; i < num_pontos; i++)); do
		sleep $delay
		echo -n "."
	done
	echo ""
}
loading "Inicializando"
