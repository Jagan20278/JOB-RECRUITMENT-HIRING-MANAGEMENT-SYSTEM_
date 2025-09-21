import { LightningElement, track } from 'lwc';
// Import the Apex method
import findOpenJobs from '@salesforce/apex/jobSearchController.findOpenJobs';

export default class JobSearch extends LightningElement {
    // Reactive properties to store our data and search term
    @track jobs;
    @track error;
    searchKey = '';

    // This function runs whenever the text in the search box changes
    handleKeyChange(event) {
        this.searchKey = event.target.value;
    }

    // This function runs when the 'Search' button is clicked
    handleSearch() {
        // Call our Apex method 'findOpenJobs' and pass the searchKey
        findOpenJobs({ searchKey: this.searchKey })
            .then(result => {
                // If the call is successful, store the results
                this.jobs = result;
                this.error = undefined;
            })
            .catch(error => {
                // If the call fails, store the error
                this.error = error;
                this.jobs = undefined;
            });
    }
}