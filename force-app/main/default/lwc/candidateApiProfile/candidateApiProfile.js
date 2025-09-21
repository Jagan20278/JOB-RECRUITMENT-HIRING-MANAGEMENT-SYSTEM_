import { LightningElement, api, track } from 'lwc';
// Import the Apex method we created
import getProfileData from '@salesforce/apex/CandidateProfileService.getProfileData';

export default class CandidateApiProfile extends LightningElement {
    // The @api decorator allows this component to get the ID of the page it's on
    @api recordId; 
    
    // Reactive properties to store the data and any errors
    @track profileData;
    @track error;

    // This function runs when the button is clicked
    handleFetchProfile() {
        // Call the Apex method and pass the current candidate's ID
        getProfileData({ candidateId: this.recordId })
            .then(result => {
                // The result from Apex is a raw text (JSON) string.
                // This line formats it nicely with indentation.
                this.profileData = JSON.stringify(JSON.parse(result), null, 2);
                this.error = undefined;
            })
            .catch(error => {
                this.error = error.body.message;
                this.profileData = undefined;
            });
    }
}