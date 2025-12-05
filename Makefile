.PHONY: test validate fmt clean

test:
	cd tests && go test -v -timeout 30m

validate:
	terraform init -backend=false
	terraform validate
	terraform fmt -check -recursive

fmt:
	terraform fmt -recursive

clean:
	rm -rf .terraform
	rm -f .terraform.lock.hcl
	rm -f terraform.tfstate*
