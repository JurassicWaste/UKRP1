# Crown Framework - Built for Serious British Roleplay

Deployable txAdmin starter for Crown Framework.

## Included
- crown_core base resource
- basic player bootstrap
- UK-style job/permission model
- callback system
- txAdmin recipe
- SQL starter schema

## Dependencies
- oxmysql

## Exports
- GetPlayer(source)
- GetPlayerByCitizenId(citizenId)
- SetJob(source, jobName, grade)
- HasPermission(source, permission)
- client export: GetPlayerData()

## Next build order
1. crown_identity
2. crown_banking
3. crown_jobs
4. crown_housing
5. crown_business
6. crown_vehicles
7. crown_crime
