


# LOGIN

    # --- Request --- #

    const response = await fetch('m_api', {
        method: 'POST',
        headers: {
            'x-api-key': "c4316f07b6c87e4aa6bfe8ee7adada86e364fe23d7a9cf8171b9bf8461c2ba85",
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            m_name: "hacker",
            m_id: "ua98hack21",
            endpoint: "login_form",
            data: {
                email: 'adamabdulrafik1@gmail.com',
                password: 'hey123456'
            },
        }),
        }).then(res=>{
            // console.log()
            return res.json()
        })
        .then(data => {
            console.log(data.response.data);
    })

    # --- Response --- #

        
        data : {
            user_id: '1', 
            fname: 'Rafik', 
            lname: 'Adam', 
            username: '(`fname` + `lname`)', 
            phone: '0550450337', 
            …
        },
        message: "success",
        status : 200
