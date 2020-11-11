

all: provision

clean: destroy delete_logs

reset:  validate clean up

validate:
	vagrant validate

up: validate
	vagrant up 2>&1 | tee up.log

reload: validate
	vagrant reload

provision: validate
	vagrant provision

destroy: validate
	vagrant destroy -f

delete_logs:
	rm -f *.log
