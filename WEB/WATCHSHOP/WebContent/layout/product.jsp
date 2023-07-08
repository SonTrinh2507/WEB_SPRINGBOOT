     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = 'c' %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 
 <section class="products section container" id="products">
                <h2 class="section__title">
                    Products
                </h2>

                <div class="products__container grid">
                    <article class="products__card">
                        <img src="assets/img/product1.png" alt="" class="products__img">

                        <h3 class="products__title">Spirit rose</h3>
                        <span class="products__price">$1500</span>

                        <button class="products__button">
                            <i class='bx bx-shopping-bag'></i>
                        </button>
                    </article>
                    
					<c:forEach var = "item" items = "${watchs}">
                    <article class="products__card">
                        <img src="assets/img/${item.picture}" alt="" class="products__img">

                        <h3 class="products__title">${item.watch_name}</h3>
                        <span class="products__price">${item.price}</span>

                        <button class="products__button">
                            <i class='bx bx-shopping-bag'></i>
                        </button>
                    </article>
					</c:forEach>
                    <article class="products__card">
                        <img src="assets/img/product3.png" alt="" class="products__img">

                        <h3 class="products__title">Jubilee black</h3>
                        <span class="products__price">$870</span>

                        <button class="products__button">
                            <i class='bx bx-shopping-bag'></i>
                        </button>
                    </article>

                    <article class="products__card">
                        <img src="assets/img/product4.png" alt="" class="products__img">

                        <h3 class="products__title">Fosil me3</h3>
                        <span class="products__price">$650</span>

                        <button class="products__button">
                            <i class='bx bx-shopping-bag'></i>
                        </button>
                    </article>

                    <article class="products__card">
                        <img src="assets/img/product5.png" alt="" class="products__img">

                        <h3 class="products__title">Duchen</h3>
                        <span class="products__price">$950</span>

                        <button class="products__button">
                            <i class='bx bx-shopping-bag'></i>
                        </button>
                    </article>
                </div>
            </section>