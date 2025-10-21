public with sharing class LeadDataController {
    @AuraEnabled(cacheable=false)
    public static String getLeadScore(String leadName, String company, String industry, String description) {
        try {
            String prompt =
            'You are an expert B2B sales AI that evaluates leads for solar energy conversion likelihood. ' +
            'Return ONLY valid JSON — do not include text or explanations. ' +
            'The JSON must contain these exact keys (all required): ' +
            '"score" (integer 0–100), ' +
            '"likelihood" (string: "High", "Medium", or "Low"), ' +
            '"top_factors" (array of 2–4 concise bullet reasons), ' +
            '"recommendation" (string, specific next action for the sales rep). ' +
            'If any information is missing, make reasonable assumptions. ' +
            'Lead details: ' +
            'Name: ' + leadName + ', Company: ' + company + ', Industry: ' + industry +
            ', Description: ' + description + '.';


            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:OpenAI_NC/v1/chat/completions');
            request.setMethod('POST');
            request.setHeader('Content-Type', 'application/json');

            request.setBody(JSON.serialize(new Map<String, Object>{
                'model' => 'gpt-4o-mini',
                'messages' => new List<Object>{
                    new Map<String, String>{
                        'role' => 'system',
                        'content' => 'You are an expert sales analyst who rates B2B leads based on potential conversion.'
                    },
                    new Map<String, String>{
                        'role' => 'user',
                        'content' => prompt
                    }
                },
                'max_tokens' => 100
            }));

            HttpResponse response = http.send(request);

            Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> choices = (List<Object>) result.get('choices');
            if (!choices.isEmpty()) {
                Map<String, Object> choice = (Map<String, Object>) choices[0];
                Map<String, Object> message = (Map<String, Object>) choice.get('message');
                String aiMessage = (String) message.get('content');
                return aiMessage;
            } else {
                return 'No choices returned from OpenAI.';
            }

        } catch (Exception e) {
            return 'Error: ' + e.getMessage();
        }
    }
}
