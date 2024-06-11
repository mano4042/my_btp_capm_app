module.exports = (cds) => {
    cds.on("hello",(req) => {
        return "Welcome " + req.data.name + " Welcome eo CAP";
    });


    const { ReadEmployeeSrv } = cds.entities;

    cds.on('READ',ReadEmployeeSrv, () =>{
        let aData = [];
        aData.push({
            "ID": "02BD2137-0890-1EEA-A6C2-BB55C19787DE",
            "nameFirst": "Manoj",
            "nameMiddle": "Kumar",

        });

        aData.push({
            "ID": "02BD2137-0890-1EEA-A6C2-BB55C19787RR",
            "nameFirst": "Sanjay",
            "nameMiddle": "Ramasamay",

        });

        return aData;
    });
}