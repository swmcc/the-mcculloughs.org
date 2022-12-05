CURRENT_BRANCH := `git branch --show-current`

branch:
	echo $(CURRENT_BRANCH)

local.console:
	bundle exec rails console

local.db.console:
	psql lins_development

local.db.drop:
	bundle exec rails db:drop

local.db.migrate:
	bundle exec rails db:migrate

local.db.seed:
	bundle exec rails db:seed

local.db.setup:
	bundle exec rails db:create
	bundle exec rails db:migrate
	bundle exec rails db:seed

local.run:
	./bin/dev	

local.setup:
	bundle exec rails db:create
	bundle exec rails db:migrate
	bundle exec rails db:seed

local.tests:
	bundle exec rspec

production.console:
	heroku run rails console

production.db.shell:
	asdf

production.db.migrate:
	heroku run rake db:migrate

production.setup:
	heroku create
	git push heroku main
	heroku run rake db:migrate
	heroku ps:scale web=1

production.deploy:
	git push production main

production.logs:
	heroku logs --tail
