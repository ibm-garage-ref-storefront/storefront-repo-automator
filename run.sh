
export org=storefront-dev
spring_repos=([1]="orders-ms-spring" [2]="auth-ms-spring" [3]="customer-ms-spring" [4]="catalog-ms-spring" [5]="inventory-ms-spring")

cd ..

# create empty repo
for repo in "${spring_repos[@]}"
do 
    echo "Creating repo $repo " 
    echo -e "n" | gh repo create $org/$repo --public
    
done

sleep 5

# fork repo
for repo in "${spring_repos[@]}"
do 
    echo "Creating repo $repo " 
    gh repo fork https://github.com/ibm-garage-ref-storefront/$repo
    
done

sleep 5

# Push all new repos to the org
for repo in "${spring_repos[@]}"
do 
    echo "Pushing repo $repo "
    pwd
    echo "cding to the repo"
    cd $repo
    pwd
    rm -rf .git
    git init
    git add .
    git remote add origin https://github.com/$org/$repo
    git commit -m "forked $repo from storefront"
    git push -u origin master
    # cd ..
    echo "cding up"
    pwd
done

