import express, { Application, Request, Response, NextFunction } from "express";

const app: Application = express()

export function startServ() {
    const add = (a: number, b: number): number => a + b;

    app.get('/add', (req: Request, res: Response, next: NextFunction) => {
        // console.log(add(req.query.no,req.query.nt)
        res.send('HELLO WORLD ', add(req.query.no));
    });
    
    app.listen(5000, () => console.log('server running port 5000'))    
}