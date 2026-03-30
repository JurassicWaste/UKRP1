CrownJobs = {
    unemployed = {
        label = "Unemployed",
        structure = "casual_hourly",
        grades = {
            [0] = { key = "unemployed", title = "Unemployed", salary = 0, permissions = {} }
        }
    },

    police = {
        label = "Police",
        structure = "ranked_public_service",
        grades = {
            [0] = { key = "pcso", title = "Police Community Support Officer", salary = 1850, permissions = {} },
            [1] = { key = "constable", title = "Police Constable", salary = 2400, permissions = {} },
            [2] = { key = "sergeant", title = "Police Sergeant", salary = 3100, permissions = { roster = true } },
            [3] = { key = "inspector", title = "Inspector", salary = 4000, permissions = { roster = true, hire = true, discipline = true } },
            [4] = { key = "chief_inspector", title = "Chief Inspector", salary = 4700, permissions = { roster = true, hire = true, fire = true, discipline = true } },
            [5] = { key = "superintendent", title = "Superintendent", salary = 5600, permissions = { roster = true, hire = true, fire = true, discipline = true, budget = true } }
        }
    },

    nhs = {
        label = "NHS Ambulance Service",
        structure = "banded_public_service",
        grades = {
            [0] = { key = "eca", title = "Emergency Care Assistant", salary = 2100, permissions = {} },
            [1] = { key = "paramedic", title = "Paramedic", salary = 2700, permissions = {} },
            [2] = { key = "specialist_paramedic", title = "Specialist Paramedic", salary = 3400, permissions = { roster = true } },
            [3] = { key = "team_leader", title = "Team Leader", salary = 4100, permissions = { roster = true, hire = true } },
            [4] = { key = "service_manager", title = "Service Manager", salary = 5200, permissions = { roster = true, hire = true, fire = true, budget = true } }
        }
    },

    council_refuse = {
        label = "Council Refuse Service",
        structure = "public_service",
        grades = {
            [0] = { key = "refuse_loader", title = "Refuse Loader", salary = 1850, permissions = {} },
            [1] = { key = "refuse_driver", title = "Refuse Driver", salary = 2250, permissions = {} },
            [2] = { key = "crew_supervisor", title = "Crew Supervisor", salary = 2850, permissions = { rota = true, hire = true } },
            [3] = { key = "depot_manager", title = "Depot Manager", salary = 3950, permissions = { rota = true, hire = true, fire = true, budget = true } }
        }
    }
}
