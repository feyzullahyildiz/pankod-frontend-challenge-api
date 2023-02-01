# Pankod Frontend Challange için Hazır Backend API
- [json-server](https://www.npmjs.com/package/json-server) kullanılmıştır.
- Örnek Entity
```json
{
    "title": "Wolf Creek",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    "programType": "series",
    "images": {
        "Poster Art": {
            "url": "https://streamcoimg-a.akamaihd.net/000/128/61/12861-PosterArt-ec32a81986a45eac7e080112075ab466.jpg",
            "width": 1000,
            "height": 1500
        }
    },
    "releaseYear": 2016
}
```

## API'ye ait genel filtreleme, sıralama mantığı
- Tüm yapı query params ile çalışıyor. Detaylı dökümantasyon için [json-server dökümantasonuna](https://www.npmjs.com/package/json-server#filter) bakınız.
- `?programType=series`: `programType` değeri `series` olan verileri getirir.
- `?releaseYear_gte=2010`:  `releaseYear` değeri `2010` ve sonrası olan verileri getirir.
- `?_limit=10`: en fazla 10 tane veri getirir. Toplam veri sayısı için response headerdaki `X-Total-Count` değerine bakınız.
- `?_sort=relaseYear,title&_order=asc,desc`: sıralama için relaseYear öncelikli asc. title değeri desc olacak şekilde sıralama yapar.
- `?title_like=Ali`: title değerinde `Ali` değeri olan sonuçları verir.


## İsterler dahilinde örnek İstekler
```bash
# Filtre
# movie'ye göre filtereleme ve en fazla 21 tane movie
http://localhost:8080/entries?programType=series&_limit=21
# series'e göre filtereleme ve en fazla 21 tane series
http://localhost:8080/entries?programType=movie&_limit=21

# releaseYear'ı 2010'dan büyük olanlar için filtreleme
http://localhost:8080/entries?releaseYear_gte=2010
# title'ın içinde You değeri olan sonuçları verir
http://localhost:8080/entries?title_like=You

# SORT
# releaseYear'a göre desc
http://localhost:8080/entries?_sort=releaseYear&_order=desc
# releaseYear'a göre asc
http://localhost:8080/entries?_sort=releaseYear&_order=asc
# title'a göre asc
http://localhost:8080/entries?_sort=title&_order=asc
# title'a göre desc
http://localhost:8080/entries?_sort=title&_order=desc


# Sayfalama (Pagination)
# ikinci sayfayı getirir ve max 21 kayıt verir
http://localhost:8080/entries?_page=2&_limit=21

```

# Başlatmak için
Not: `create-react-app` ile oluşturulan react uygulamalarının ve `nextjs`'in default port'u `3000` olduğu için portu `8080` ile değiştirerek yapıyoruz.
- nodejs ile
    - `npm install -g json-server`
    - `json-server --port 8080 ./db.json`
- docker ile
    - `docker run --rm --name api -p 8080:8080 feyzullahyildiz/pankod-frontend-challenge-api`