


# endpoints
    vendor_signup_form
    user_signup_form
    login_form
    categories

    fetch_ads

        in the data array
            
            for: 
                promo_ads
                trending
                most_popular
                shop_ads

            limit: ...

            by_category: ... ( Only for shop_ads )

            search: ... ( Only for shop_ads )

            side_search_input: ... ( Only for shop_ads )




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






# For Fetching Ads
    const response = await fetch('m_api', {
        method: 'POST',
        headers: {
            'x-api-key': "c4316f07b6c87e4aa6bfe8ee7adada86e364fe23d7a9cf8171b9bf8461c2ba85",
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            m_name: "hacker",
            m_id: "ua98hack21",
            endpoint: "fetch_ads",
            data: {
                for: "...",
                limit: 5,
                by_category: "...", ( Only for shop_ads )
                search: "...", ( Only for shop_ads )
                side_search_input: "..."  ( Only for shop_ads )
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
            0: {ad_id: '37', vendor_id: '0', title: 'Slippers', tags: '', post_author: 'aansahfrank14', …}
            1: {ad_id: '4', vendor_id: '0', title: 'Air Jordan', tags: '', post_author: 'manupatience53', …}
            2: {ad_id: '27', vendor_id: '0', title: 'Ahenemaa Pabowa', tags: '', post_author: 'arthurmavis736', …}
            3: {ad_id: '7', vendor_id: '0', title: 'EVE FACE AND BODY', tags: '', post_author: 'tutue621', …}
            4: {ad_id: '33', vendor_id: '0', title: 'Indoor', tags: 'home', post_author: 'evelynmensah950', …}
        },
        status : 200

