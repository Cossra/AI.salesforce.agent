public with sharing class LeadScoringController {
    @AuraEnabled(cacheable=false)
    public static String getLeadScore(String leadName, String company, String industry, String description) {
        try {
            String prompt = 'Rate the likelihood that this lead will convert on a scale of 0–100. '
                + 'Include reasoning in JSON format with fields: score, likelihood, and recommendedAction. '
                + 'Lead details: '
                + 'Name: ' + leadName + '. '
                + 'Company: ' + company + '. '
                + 'Industry: ' + industry + '. '
                + 'Description: ' + description + '.';

            // ✅ Use your working Named Credential
            HttpRequest req = new HttpRequest();
            req.setEndpoint('callout:OpenAI_NC/v1/chat/completions');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json');

            Map<String, Object> body = new Map<String, Object>{
                'model' => 'gpt-4o-mini',
                'messages' => new List<Object>{
                    new Map<String, Object>{
                        'role' => 'system',
                        'content' => 'You are an AI marketing assistant that scores leads for conversion likelihood.'
                    },
                    new Map<String, Object>{
                        'role' => 'user',
                        'content' => prompt
                    }
                },
                'max_tokens' => 100
            };

            req.setBody(JSON.serialize(body));

            Http http = new Http();
            HttpResponse res = http.send(req);

            if (res.getStatusCode() == 200) {
                Map<String, Object> parsed = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                List<Object> choices = (List<Object>) parsed.get('choices');
                if (!choices.isEmpty()) {
                    Map<String, Object> choice = (Map<String, Object>) choices[0];
                    Map<String, Object> message = (Map<String, Object>) choice.get('message');
                    String content = (String) message.get('content');
                    return content;
                }
                return 'No choices returned from OpenAI.';
            } else {
                return 'Error: ' + res.getStatus() + ' - ' + res.getBody();
            }
        } catch (Exception e) {
            return 'Exception: ' + e.getMessage();
        }
    }
}
