.DEFAULT_GOAL: migrate
.PHONY: migrate clean migrateTest cleanTest

migrate:
	@echo "Migrating main db..."
	flyway migrate -configFiles="./flyway.conf" -workingDirectory=".\Flyway" -url="jdbc:sqlserver://localhost:1433;databaseName=esencialverde;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community

clean:
	@echo "Cleaning main db..."
	flyway clean -configFiles="./flyway.conf" -workingDirectory=".\Flyway" -url="jdbc:sqlserver://localhost:1433;databaseName=esencialverde;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community

migrateTest:
	@echo "Migrating evtest..."
	flyway migrate -configFiles="./flyway.conf" -workingDirectory=".\scripts\evTestFlyway" -url="jdbc:sqlserver://localhost:1433;databaseName=evtest;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community

cleanTest:
	@echo "Cleaning..."
	flyway clean -configFiles="./flyway.conf" -workingDirectory=".\scripts\evTestFlyway" -url="jdbc:sqlserver://localhost:1433;databaseName=evtest;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community
