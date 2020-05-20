import {Application} from "express";
import {SupplierService} from "";

export class CustomerController{
    customer_service: CustomerService;
    constructor(private app: Application){
        this.customer_service = new CustomerService();
        this.routes();
    }
    private routes(){
        
        this.app.route("/customer/:id")
        .put(this.customer_service.updateOne);        
        
        this.app.route("/customer").get(this.customer_service.getAll);
    }
}