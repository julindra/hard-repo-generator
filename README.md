# hard-repo-generator
just a scheduler for repo-generator 

## how-to
1. Copy `script-data.sh.template` to `script-data.sh`
2. Change `TOKEN`, `GENERATOR`, and `INPUT` in `script-data.sh` as your needs
3. Change `P0-schedule.txt` or `P1-schedule.txt`
	- change the organization name and set number (for P0) at line 1
	- line 2 onwards is the schedule
		- P0 format `<date> <weekday>`
			- example: `01 w1d1` or `01 w1d1 _ pm` to run at pm
		- P1 format `<date> <week> <day> [pm]`
			- example: `01 week-1 day-1` or `01 week-1 day-1 pm` to run at pm
4. Add `script.sh` to your crontab file
	```
	30 09 * * * /path/to/hard-repo-generator/script.sh
	30 13 * * * /path/to/hard-repo-generator/script.sh
	```
	**note:** the default/am schedule must be run before 12
