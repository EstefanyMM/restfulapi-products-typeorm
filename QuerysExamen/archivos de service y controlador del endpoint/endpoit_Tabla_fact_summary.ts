import {Request, Response} from "express";
import {getConnection} from "typeorm";
import {Customer,ICustomer,IResult} from "";

export class CustomerService{

    public async getAll(req: Request, res: Response){
        const customers = await getConnection().getRepository(Customer).find();
        res.status(200).json(customers);
    }

    public async updateOne(req:Request, res: Response){
        try{

            await getConnection().createQueryBuilder().update(Customer)
            .set({
                CustomerName: req.body.CustomerName,
                SuplierID: req.body.SupplierID,
                SupplierName: req.body.SupplierName,
                mes: req.body.mes,
                anio: req.body.anio,
                Total: req.body.Total,
                superoPromedio: req.body.superoPromedio,
                porcentajeVentaMensual: req.body.porcentajeVentaMensual
            })
            .where("CustomerID = :id",{id: req.params.id})
            .execute();

            res.status(200).json({
                updated: true
            });


        }catch(Error){
            res.status(401).json({
                updated: false,
                Message: Error.Message
            });
        }
    }

   

}