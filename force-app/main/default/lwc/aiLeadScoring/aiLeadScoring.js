import { LightningElement, track } from 'lwc';
import getLeadScore from '@salesforce/apex/LeadDataController.getLeadScore';

export default class AiLeadScoring extends LightningElement {
    @track leadName = '';
    @track company = '';
    @track industry = '';
    @track description = '';
    @track aiResult = null;
    @track loading = false;

    handleInputChange(event) {
        const field = event.target.name;
        this[field] = event.target.value;
    }

    async handleScoreLead() {
        this.loading = true;
        this.aiResult = null;

        try {
            const result = await getLeadScore({
                leadName: this.leadName,
                company: this.company,
                industry: this.industry,
                description: this.description
            });

            let parsed;
            try {
                const cleaned = result
                    .replace(/```json/i, '')
                    .replace(/```/g, '')
                    .trim();
                parsed = JSON.parse(cleaned);
            } catch (err) {
                parsed = null;
            }

            if (parsed && parsed.score) {
                let likelihood = 'Unknown';
                let likelihoodClass = '';
                const score = parsed.score;
                if (typeof score === 'number') {
                    if (score >= 85) {
                        likelihood = 'High';
                        likelihoodClass = 'likelihood-high'; // green
                    } else if (score >= 70) {
                        likelihood = 'Moderate';
                        likelihoodClass = 'likelihood-medium'; // yellow
                    } else {
                        likelihood = 'Low';
                        likelihoodClass = 'likelihood-low'; // red
                    }
                }
                this.aiResult = {
                    score: score,
                    likelihood: likelihood,
                    likelihoodClass: likelihoodClass,
                    factors: Array.isArray(parsed.top_factors)
                        ? parsed.top_factors.join(', ')
                        : parsed.top_factors || 'Not specified.',
                    recommendation:
                        parsed.recommendedAction ||
                        parsed.recommendation ||
                        'No recommendation provided.'
                };
            } else {
                this.aiResult = { raw: result };
            }
        } catch (error) {
            console.error('Error scoring lead:', error);
            this.aiResult = { raw: 'Error: ' + (error.body?.message || error.message) };
        } finally {
            this.loading = false;
        }
    }
}
