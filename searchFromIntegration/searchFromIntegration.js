import { LightningElement, track } from 'lwc';
import getRecord from '@salesforce/apex/SearchFromIntegrationController.getRecord';

export default class SearchFromIntegration extends LightningElement {
    @track serchKey;
    @track records;
    @track error;
    @track isOpen = false;
    @track listExamReport;
    @track currentIndex;
    @track cloneRecords;
    
    inputChange(event){
        this.serchKey = event.target.value;
    }

    srchData(){
        //alert('serchKey -> '+this.serchKey);
        getRecord({firstName : this.serchKey})
            .then(result => {
                this.records = result;
                this.cloneRecords =  JSON.parse(JSON.stringify( this.records));
            })
            .catch(error => {
                this.error = error;
            });
            this.isOpen = true;
    }

    closeModal(){
        this.isOpen = false;
    }

    viewRelated(event){
        this.currentIndex = event.target.name; 
        //alert(   this.currentIndex = event.target.name);
        this.currRecord = this.cloneRecords[this.currentIndex];
        this.listExamReport = this.cloneRecords[this.currentIndex].ExamReportList;
        this.cloneRecords[this.currentIndex].isExpanded = !this.cloneRecords[this.currentIndex].isExpanded;
        //alert('this.currentIndex '+this.currentIndex+'mrks -> '+JSON.stringify(this.listExamReport)+' -> '+this.listExamReport.length);
        
    }
    

    hideRelated(event){
        this.currentIndex = event.target.name;
        this.cloneRecords[this.currentIndex].isExpanded = !this.cloneRecords[this.currentIndex].isExpanded;
    }
}