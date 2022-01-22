/**
    code to bring regions from user event selection
 */

var countryElement = document.getElementById('country');
var provinceElement = document.getElementById('province');
var municipalityElement = document.getElementById('municipality');
var communeElement = document.getElementById('commune');
var neighborhoodElement = document.getElementById('neighborhood');

countryElement.addEventListener('change', () => {
    var url = "http://localhost:8080/medical-system/RegionResponseServlet?id=" +
      countryElement.value + "&name=province";

    var provinces =  getRegions(url);
    
    provinces.then(province => {        
        appendToSelection(province, provinceElement);
    });
});

provinceElement.addEventListener('change', () => {
    var url = "http://localhost:8080/medical-system/RegionResponseServlet?id=" +
      provinceElement.value + "&name=municipality";

    var municipalities =  getRegions(url);
    municipalities.then(municipalities_ => {
        console.log(municipalities_);
        
        appendToSelection(municipalities_, municipalityElement);
    });
});

municipalityElement.addEventListener('change', () => {
    var url = "http://localhost:8080/medical-system/RegionResponseServlet?id=" +
      municipalityElement.value + "&name=commune";

    var communes =  getRegions(url);
    communes.then(communes_ => {
        console.log(communes_);
        
        appendToSelection(communes_, communeElement);
    });
});

communeElement.addEventListener('change', () => {
    var url = "http://localhost:8080/medical-system/RegionResponseServlet?id=" +
      communeElement.value + "&name=neighborhood";

    var neighborhoods =  getRegions(url);
    neighborhoods.then(neighborhoods_ => {
        console.log(neighborhoods_);
        
        appendToSelection(neighborhoods_, neighborhoodElement);
    });
});



async function getRegions (url) {
    const response = await fetch(url);
    return await response.json();
}

function appendToSelection(json, region) {
    while (region.firstChild) {
        region.removeChild(region.firstChild);
    }
    
    var option = document.createElement('option');
    option.innerHTML = "Select ...";
    region.appendChild(option);
    
    for (let i = 0; i < json.length; i++) {
        var option_ = document.createElement('option');
        option_.value = json[i].pkRegion;
        option_.innerHTML = json[i].name;
        region.appendChild(option_);
    }
    
    console.log(region.childNodes);
}