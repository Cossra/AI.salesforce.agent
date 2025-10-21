import { LightningElement, track } from 'lwc';
import getLeads from '@salesforce/apex/LeadDataController.getLeads';
import getLeadScore from '@salesforce/apex/LeadScoringController.getLeadScore';

export default class AiLeadScoring extends LightningElement {
    @track leads;
    @track error;

    async handleFetchLeads() {
        try {
            const leadData = await getLeads();
            const updatedLeads = [];

            for (const lead of leadData) {
                const score = await getLeadScore({
                    leadName: lead.Name,
                    company: lead.Company,
                    industry: lead.Industry,
                    description: lead.Description
                });
                updatedLeads.push({ ...lead, Score: score });
            }

            this.leads = updatedLeads;
            this.error = undefined;
        } catch (err) {
            console.error('Error fetching leads:', err);
            this.error = err.body ? err.body.message : err.message;
            this.leads = undefined;
        }
    }
}
