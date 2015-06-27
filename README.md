# Touchbaseapi

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.


knowledgebase
id
title
short_description
detailed_description
owner
created_by
created_date
updated_by
updated_date
active

mix phoenix.gen.json Knowledgebase knowledgebases kb_id:uuid title:string  short_description:text detailed_description:text created_date:datetime updated_time:datetime active:boolean
