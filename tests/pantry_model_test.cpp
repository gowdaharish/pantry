#include <QTest>
#include <QObject>
#include <QCoreApplication>
#include <QDebug>

#include "food_item.h"
#include "pantry_model.h"

class PantryModelTest : public QObject
{
    Q_OBJECT

public:
    PantryModelTest() {};

private slots:
    void canCreateFoodItem();
    void canAddFootItemToModel();
    void canDeleteItemFromModel();
};

void PantryModelTest::canCreateFoodItem()
{
    FoodItem item("Meat", "10");

    QVERIFY(!item.name().isEmpty());
    QVERIFY(!item.expiryDays().isEmpty());

    QCOMPARE(item.name(), "Meat");
    QCOMPARE(item.expiryDays(), "10");
}

void PantryModelTest::canAddFootItemToModel()
{
    FoodItem item1{"Vegetables", "1"};
    PantryModel model;

    model.addFoodItem(item1.name(), item1.expiryDays());
    QVERIFY(model.rowCount() == 1);

    FoodItem item2{"Fish", "10"};
    model.addFoodItem(item2.name(), item1.expiryDays());
    QVERIFY(model.rowCount() == 2);
}

void PantryModelTest::canDeleteItemFromModel()
{
    FoodItem item1{"Fish", "3"};
    FoodItem item2{"Vegetables", "10"};
    PantryModel model;

    model.addFoodItem(item1.name(), item1.expiryDays());
    model.addFoodItem(item2.name(), item2.expiryDays());

    QVERIFY(model.rowCount() == 2);
    model.deleteFoodItem(1);
    QVERIFY(model.rowCount() == 1);
    model.deleteFoodItem(0);
    QVERIFY(model.rowCount() == 0);
    // shouldn't crash
    model.deleteFoodItem(0);
    QVERIFY(model.rowCount() == 0);
}

QTEST_MAIN(PantryModelTest)
#include "pantry_model_test.moc"
