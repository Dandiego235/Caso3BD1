.DEFAULT_GOAL: migrate
.PHONY: migrate clean repair migrateTest cleanTest repairTest

migrate:
	@echo "Migrating main db..."
	flyway migrate -configFiles="./flyway.conf" -workingDirectory=".\Flyway" -url="jdbc:sqlserver://localhost:1433;databaseName=esencialverde;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community

clean:
	@echo "Cleaning main db..."
	flyway clean -configFiles="./flyway.conf" -workingDirectory=".\Flyway" -url="jdbc:sqlserver://localhost:1433;databaseName=esencialverde;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community

repair:
	@echo "Repairing main db..."
	flyway repair -configFiles="./flyway.conf" -workingDirectory=".\Flyway" -url="jdbc:sqlserver://localhost:1433;databaseName=esencialverde;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community

info:
	@echo "Info main db..."
	flyway info -configFiles="./flyway.conf" -workingDirectory=".\Flyway" -url="jdbc:sqlserver://localhost:1433;databaseName=esencialverde;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community

migrateTest:
	@echo "Migrating evtest..."
	flyway migrate -configFiles="./flyway.conf" -workingDirectory=".\scripts\evTestFlyway" -url="jdbc:sqlserver://localhost:1433;databaseName=evtest;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community

cleanTest:
	@echo "Cleaning evtest..."
	flyway clean -configFiles="./flyway.conf" -workingDirectory=".\scripts\evTestFlyway" -url="jdbc:sqlserver://localhost:1433;databaseName=evtest;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community

repairTest:
	@echo "Repairing evtest..."
	flyway repair -configFiles="./flyway.conf" -workingDirectory=".\scripts\evTestFlyway" -url="jdbc:sqlserver://localhost:1433;databaseName=evtest;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community	

infoTest:
	@echo "Info evtest..."
	flyway info -configFiles="./flyway.conf" -workingDirectory=".\scripts\evTestFlyway" -url="jdbc:sqlserver://localhost:1433;databaseName=evtest;encrypt=false;integratedSecurity=true;trustServerCertificate=true" -community	