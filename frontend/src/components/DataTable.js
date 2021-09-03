import React, {useState} from "react";
import {Table, Select} from 'antd'
const {Option} = Select;

export default function DataTable(){
    const [years, setYears] = useState();
    const [countries, setCountries] = useState();
    const fetchYears = async () => {
        const res = await fetch("http://localhost:8000/getyears")
        setYears(res.json())
    }
    const fetchCountries = async () => {
        const res = await fetch("http://localhost:8000/getcountries")
        setCountries(res.json())
    }

    const handleYears = (e) => {
        setYears(e.target.value)
    }

    fetchYears()
    fetchCountries()


    return(
        <div>
            {years.map((year)=>{
                return console.log(year)
            })}
        </div>
    )
}