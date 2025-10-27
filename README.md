# Description
Deploying model on foundry

# techincal details
one creating an cognitive service kind "AIServices" you are creating an AI foundry resource
you can create projects but this projects are directly connected to the AI foundry resources
so you cannot isolate them at least in this TPU model deployment (the standard one and recommended)
there are other 2 deployment options
Deployment to serverless API endpoints in Azure AI Hub resources
Deployment to managed computes in Azure AI Hub resources
this other two requires using hubs that will under the hood

openai models require the ai foundry resource to deploy over there, in case you are using hubs you need to connect the AI resource to your hub.
the advantage of the hubs is you can also deploy hugging face models

using the normal TPU model deployment you can also deploy other models like grok whoithout the need of hubs. you can choose between 122 models

setup permissions via RBAC or API KEY

for this you assign the AI developer role over the AI foundry resource

---projects shoud isolate the access to the models but they are not
instead you allow access via RBAC, all models are visible for the users

# test it is working as expected
run test