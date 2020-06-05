org=storefront-dev
initials=${initials: hk}
spring_repos=([1]="orders-ms-spring" [2]="auth-ms-spring" [3]="customer-ms-spring" [4]="catalog-ms-spring" [5]="inventory-ms-spring" [6]="storefront-ui" [7]="storefront-mobile-ionic")

cd ..

# create empty repo
for repo in "${spring_repos[@]}"
do 
    echo "Creating repo " $org/$repo"-"$initials
    echo -e "n" | gh repo create $org/$repo"-"$initials --public
done
sleep 5

# clone repo
for repo in "${spring_repos[@]}"
do 
    echo "Cloning repo ibm-garage-ref-storefront/" $repo
    gh repo clone https://github.com/ibm-garage-ref-storefront/$repo
done
sleep 5

# Push all new repos to the org
for repo in "${spring_repos[@]}"
do 
    echo "Pushing repo " $org/$repo"-"$initials
    cd $repo
    rm -rf .git
    git init
    git add .
    git remote add origin https://github.com/$org/$repo"-"$initials
    git commit -m "forked $repo from storefront"
    git push -u origin master
    cd ../
    pwd
done

