
myremoveduplicates :: Eq a => [a] -> [a] 
myremoveduplicates = removehelper []     
    where removehelper seen [] = seen  
          removehelper seen (x:xs)
              | x `elem` seen = removehelper seen xs 
              | otherwise = removehelper (seen ++ [x]) xs


myintersection_pm :: Eq a => [a] -> [a] -> [a]
myintersection_pm [] _ = []
myintersection_pm (x:xs) l | elem x l = x : myintersection_pm xs l
                   | otherwise = myintersection_pm xs l



mynthtail :: Int -> [a]-> [a]
mynthtail n lst
    | n == 0            = lst
    | otherwise         = mynthtail (n-1) (tail lst)

mynthtail_pm :: Int -> [a] -> [a]
mynthtail_pm 0 lst      = lst
mynthtail_pm n (x:xs)   = mynthtail_pm (n-1) xs

mylast :: [a] -> [a]
mylast lst 
    | null lst          = lst
    | null (tail lst)   = lst
    | otherwise         = mylast (tail lst)

mylast_pm :: [a] -> [a]
mylast_pm []            = []
mylast_pm (x:xs)
    = case (null xs) of 
        True -> (x:xs)
        False -> mylast_pm xs

myreverse :: [a] -> [a]
myreverse lst
    | null lst      = lst
    | otherwise     = myreverse_helper lst []

myreverse_helper :: [a] -> [a] -> [a]
myreverse_helper lst1 lst2 
    | null lst1     = lst2
    | otherwise     = myreverse_helper (tail lst1) ((head lst1):lst2)

myreverse_pm :: [a] -> [a]
myreverse_pm []     = []
myreverse_pm lst    = myreverse_helper_pm lst []

myreverse_helper_pm :: [a] -> [a] -> [a]
myreverse_helper_pm [] (y:ys)           = (y:ys)
myreverse_helper_pm (x:xs) []           = myreverse_helper_pm xs (x:[])
myreverse_helper_pm (x:xs) (y:ys)       = myreverse_helper_pm xs (x:(y:ys))



myreplaceall :: Eq a => a -> a -> [a] -> [a]
myreplaceall replace original lst
    | null lst                  = lst
    | (head lst) == original    = replace:(myreplaceall replace original (tail lst))
    | otherwise                 = (head lst):(myreplaceall replace original (tail lst))

myreplaceall_pm :: Eq a => a -> a -> [a] -> [a]
myreplaceall_pm _ _ []      = []
myreplaceall_pm v s (x:xs)  
    | s == x    = v : myreplaceall_pm v s xs
    | otherwise = x : myreplaceall_pm v s xs


myordered :: Ord a => [a] -> Bool 
myordered lst 
    | null lst                          = True
    | null (tail lst)                   = True
    | (head lst) > (head (tail lst))    = False
    | otherwise                         = myordered (tail lst)

myordered_pm :: Ord a => [a] -> Bool
myordered_pm []         = True
myordered_pm (x:[])     = True
myordered_pm (x:y:[])   = x <= y
myordered_pm (x:y:xs)   = (x <= y) && (myordered_pm (y:xs))