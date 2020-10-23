

all: provision

clean: destroy delete_logs

validate:
	vagrant validate

up: validate
	vagrant up

up-log: validate
	vagrant up 2>&1 | tee up.log

provision: validate
	vagrant provision

destroy: validate
	vagrant destroy -f

delete_logs:
	rm -f *.log

